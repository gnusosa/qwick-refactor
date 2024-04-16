import Data.Maybe
import Data.List
import Data.Char

spacesDiff x y = x == "" || if (ord $ x !! 0) < (ord $ y !! 0) then True
                            else if (ord $ x !! 0) == (ord $ y !! 0)
                                  then spacesDiff (splitStrFromIdx x 1) (splitStrFromIdx y 1)
                                  else False

checkStrsSpacesEq x y xs = if predicate then (fst $ snd y) ++ [x] ++ (snd $ snd y)
                        else (fst $ snd y) ++ (snd $ snd y) ++ adder
  where adderPred = elem (fst x) $ map (\w -> fst w) xs
        adder = if adderPred then [] else [x]
        predicate = not (null y) && spacesDiff (splitStrFromIdx (fst x) (snd x)) (splitStrFromIdx (fst $ fst y) (snd $ fst y))

withIdxOfSpace x = (x, fromJust $ elemIndex ' ' x)
mkIdxTuples = map withIdxOfSpace . filter (elem ' ') . reverse
processInput xs x = checkStrsSpacesEq x y xs
  where xstr = splitStrFromIdx (fst x) (snd x)
        y = rewind $ breakOnPrefixEq xstr xs


splitStrFromIdx x xidx = snd $ splitAt xidx x
checkPrefixOrEq x y = x `isPrefixOf` y && ((length x) >= (length y))
breakOnPrefixEq xstr xs = break (\y -> checkPrefixOrEq xstr $ splitStrFromIdx (fst y) (snd y)) xs
rewind xs = (snd xs !! 0 , ( init $ fst xs, (last $ fst xs):snd xs))

run = map (\x -> fst x) . reverse . scanl (\acc x -> processInput acc x) initial initial
  where initial = mkIdxTuples ["herrow herrow herrow", "hee loo he", "her m e"]

main = putStrLn $ show $ run
