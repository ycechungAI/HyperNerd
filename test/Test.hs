module Main where

import qualified Bot.LogTest as LS
import qualified Bot.PollTest as PT
import qualified Bot.LinksTest as BLS
import qualified Bot.TwitchTest as TS
import qualified CommandTest
import qualified Sqlite.EntityPersistenceTest as SEPS
import System.Exit
import Test.HUnit

main :: IO Counts
main = do
  results <-
    runTestTT $
    TestList
      [ BLS.textContainsLinkSpec
      , CommandTest.spec
      , SEPS.createEntityAndGetItById
      , SEPS.createSeveralEntityTypes
      , SEPS.deleteEntitiesWithPropertyEquals
      , SEPS.doublePrepareSchemaSpec
      , SEPS.getRandomEntityIdWithPropertyEquals
      , SEPS.nextEntityId
      , SEPS.selectEntitiesWithPropertyEquals
      , PT.testShowRanks
      , PT.testRank
      , PT.testRankWithEmptyList
      , LS.testSecondsAsBackwardsDiff
      , TS.twitchResponseFromJsonSpec
      ]
  if errors results + failures results == 0
    then exitSuccess
    else exitWith (ExitFailure 1)
