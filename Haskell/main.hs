import Functions
import Nat
import BinTree
main = do{
    putStrLn "\n beside 1 ";
    print $ boolStr (beside 3 4);
    print $ boolStr (beside 1 8);
    print $ boolStr (beside (Succ(Succ Zero)) (Succ(Succ(Succ Zero))));
    print $ boolStr (beside 1 (Succ(Succ(Succ(Succ(Succ(Succ(Succ Zero))))))));
    
    putStrLn "\n beside 2 ";
    print $ boolStr (beside2 1 2 3);
    print $ boolStr (beside2 1 (Succ(Succ Zero)) 3);
    print $ boolStr (beside2 10 9 1);
    print $ boolStr (beside2 10 9 3);
    
    putStrLn "\n pow ";
    print $ toString (pow (Succ(Succ Zero)) (Succ(Succ Zero)));
    print $ toString (pow (Succ(Succ Zero)) 2);
    print $ toString (pow Zero (Succ(Succ Zero)));
    print $ toString (pow 0 2);

    putStrLn "\n treeList ";
    print $ treeList [7,2,4,8,1,3,6,21,12,23,76,212,92,5,56,7,83,213,12312,15532,512];

    putStrLn "\n reverse ";
    print $ reverse_ovrd (treeList [7,2,4,8,1,3,6,21,12,23,76,212,92,5,56,7,83,213,12312,15532,512]);

    print $ depth (Node 7 (Node 2 (Node 1 (Empty,Empty),Node 4 (Node 3 (Empty,Empty),Node 6 (Empty,Empty))),Node 8 (Empty,Node 21 (Node 12 (Empty,Empty),Node 23 (Empty,Empty)))));
    print $ depth (treeList [7,2,4,8,1,3,6,21,12,23,76,212,92,5,56,7,83,213,12312,15532,512]);
    }

    -- Node 7 (Node 2 (Node 1 (Empty,Empty),Node 4 (Node 3 (Empty,Empty),Node 6 (Empty,Empty))),Node 8 (Empty,Node 21 (Node 12 (Empty,Empty),Node 23 (Empty,Empty))))
    -- ; ; ; beside2 12 15 3;
    -- pow (Succ(Succ(Succ(Succ Zero)))) 2; pow 