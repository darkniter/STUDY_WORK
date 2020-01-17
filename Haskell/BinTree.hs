module BinTree where
data BinTree a = Empty | Node a ((BinTree a), (BinTree a))
    deriving ( Eq, Ord)

-- Show,
instance (Show a) => Show (BinTree a) where

  show t = "! " ++ replace '\n' "\n: " (treeshow "" t)
    where

    treeshow pref Empty = ""

    treeshow pref (Node x (Empty, Empty)) =
                  (pshow pref x)

    treeshow pref (Node x (left, Empty)) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    treeshow pref (Node x (Empty, right)) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    treeshow pref (Node x (left, right)) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    showSon pref before next t =
                  pref ++ before ++ treeshow (pref ++ next) t

    pshow pref x = replace '\n' ("\n"++pref) (show x)

    replace c new string =
      concatMap (change c new) string
      where
          change c new x
              | x == c = new
              | otherwise = x:[] -- "x"