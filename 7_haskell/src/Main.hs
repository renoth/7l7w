module Main where

    allEven [] = []
    allEven x = filter (even) x
    allEven2(list) = [x | x <- list, even x]

    reverseList [] = []
    reverseList (h:t) = reverseList(t) ++ [h]

    col = ["black", "white", "blue", "yellow", "red"]
    colorCombinations = [(c1, c2) | c1 <- col, c2 <- col, c1 < c2]

    multiplicationTable = [(a,b,a*b) | a <- [1..12], b <- [1..12]]

    main :: IO ()
    main = do{ putStrLn(reverseList "reverse Me");
               putStrLn (show (allEven [1..25]));
               putStrLn (show (allEven2 [1..25]));
               putStrLn (show (colorCombinations));
               putStrLn (show (multiplicationTable))
               }
