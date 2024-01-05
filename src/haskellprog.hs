import System.Environment

-- Take in list of integers and subtract 255 by the integer value, then place into a list which the function outputs -> [Int]. This is to invert the colors of the image ie inverting the color of each pixel value on a black and white scale from 0-255
subtractby255 :: [Int] -> [Int]
subtractby255 [] = []
subtractby255 (x:xs) = (255-x) : subtractby255 xs

-- IO() functionality to allow command line execution of the code
main :: IO ()
main = do
    args <- getArgs
    let numbers = map read args :: [Int]
-- Here the 'numbers' that were read in are passed to the subtractby255 function (spacing and indentation are syntax requirenments to be aware of when programming with Haskell)
        result = subtractby255 numbers
        resultStrings = map show result
        outputString = unwords resultStrings
    putStrLn outputString


