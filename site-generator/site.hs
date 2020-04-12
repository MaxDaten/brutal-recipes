--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Data.Time

--------------------------------------------------------------------------------
main :: IO ()
main = do
    now <- getCurrentTime

    let postCtx :: Context String
        postCtx =
            dateField "date" "%B %e, %Y" <>
            lastGeneralUpdateField "%T - %B %e, %Y" now <>
            defaultContext

    hakyll $ do

        let globalContext =
                lastGeneralUpdateField "%T - %B %e, %Y" now <>
                defaultContext

        match "images/*" $ do
            route   idRoute
            compile copyFileCompiler

        match "css/*" $ do
            route   idRoute
            compile compressCssCompiler

        match (fromList ["about.rst", "contact.markdown"]) $ do
            route   $ setExtension "html"
            compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" globalContext
                >>= relativizeUrls

        match "posts/*" $ do
            route $ setExtension "html"
            compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" postCtx
                >>= loadAndApplyTemplate "templates/post.html"    postCtx
                >>= relativizeUrls

        create ["archive.html"] $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let archiveCtx =
                        listField "posts" postCtx (return posts) <>
                        constField "title" "Archives"            <>
                        globalContext

                makeItem ""
                    >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                    >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                    >>= relativizeUrls


        match "index.html" $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let indexCtx =
                        listField "posts" postCtx (return posts) <>
                        constField "title" "Home"                <>
                        modificationTimeField "lastUpdate" "%B %e, %Y" <>
                        globalContext

                getResourceBody
                    >>= applyAsTemplate indexCtx
                    >>= loadAndApplyTemplate "templates/default.html" indexCtx
                    >>= relativizeUrls

        match "templates/*" $ compile templateBodyCompiler


lastGeneralUpdateField :: String -> UTCTime -> Context a
lastGeneralUpdateField fmt date =
    constField "lastGeneralUpdate" $
    formatTime defaultTimeLocale fmt date