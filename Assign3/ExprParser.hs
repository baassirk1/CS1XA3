{- 
 - ----------------------------------------------------
 -                    Module parseExpr
 -                    ----------------------------------------------------
 -                    -   Takes a string of format:
 -                    -   
 -                    -   and parses an expression of Expr * 
 -                    ----------------------------------------------------
 -                    -}


module ExprParser (parseExprD,parseExprF) where

import Text.Parsec
import Text.Parsec.String

import ExprType
import ExprPretty

{-
 -   parseExpr*
 -     ----------
 -       Takes a string of format:
 -         .....
 -           and parses an expression of Expr *
 -           -}

parseExprD :: String -> Expr Double
parseExprD ss = case parse setexprD "" ss of
                  Left err -> error $ show err
                  Right expr -> expr

parseExprF :: String -> Expr Float
parseExprF ss = case parse setexprF "" ss of
                  Left err -> error $ show err
                  Right expr -> expr

setexprD :: Parser (Expr Double)
setexprD = exprVar <|> exprConstD <|> exprTrigD <|> exprExpD <|> exprOpD

setexprF :: Parser (Expr Float)
setexprF = exprVar <|> exprConstF <|> exprTrigF <|> exprExpF <|> exprOpF

{-
 - ----------------------------------------------------
 -                    exprTrigD
 -                    ----------------------------------------------------
 -                    -  exprTrigD is a function which deals with the parsing
 -                    -  of trigonometic functions.
 -                    -  More specifically, it is able to parse:
 -                    -    - Sine   (Sin)
 -                    -    - Cosine (Cos)
 -                    -}
exprTrigD :: Parser (Expr Double)
exprTrigD = do {
               s <- symbol "Cos" <|> symbol "Sin";
               ss <- exprD;

               if s == "Cos" then
                 return (Cos ss);
               else
                 return (Sin ss);
             }

{-
 - ----------------------------------------------------
 -                    exprExpD
 -                    ----------------------------------------------------
 -                    - exprExpD is a function which deals with the parsing
 -                    - of exponential functions and nearby entities.
 -                    -  More specifically, it is able to parse:
 -                    -    - Natural Exponentials (e)
 -                    -    - Natural Logarithms   (ln)
 -                    -    - Logarithms          (log)
 -                    -}
setexprExpD :: Parser (Expr Double)
setexprExpD = do {
               x <- symbol "Ln" <|> symbol "Log" <|> symbol "Exp";
               xs <- between (symbol "(") (symbol ")") (exprD);


               if x == "Ln" then
                 return (Ln ss);
               else if x == "Log" then
                 return (Log xs);
               else
                 return (Exp xs);
             }

exprConstD :: Parser (Expr Double)
exprConstD = do {
               symbol "Const";
               xs <- double;
               return (Const xs);
             }

exprOpD :: Parser (Expr Double)
exprOpD = do {
                x <- symbol "Add" <|> symbol "Mult";
                xs <- between (symbol "(") (symbol ")") (exprVar <|> exprConstD <|> exprOpD <|> exprOpD);
                xs' <- between (symbol "(") (symbol ")") (exprVar <|> exprConstD <|> exprOpD <|> exprOpD);
                {-
 -                 ----------------------------------------------------
 -                                                         NOTE
 -                                                                         ----------------------------------------------------
 -                                                                                           This parser can only have the option of
 -                                                                                                             adding or multiplying, so it's necessary
 -                                                                                                                               to check whether the initial input was
 -                                                                                                                                                 "Add" or "Mult", and return the correct
 -                                                                                                                                                                   result accordingly
 -                                                                                                                                                                                   -}
                if s == "Add" then
                  return (Add xs xs'); -- Initial s is "Add", return Add
                else -- The only other option is to return "Mult", since it wasn't "Add"
                  return (Mult xs xs')
              }


{-
 - ----------------------------------------------------
 -                    exprTrigD (FLOATS)
 -                    ----------------------------------------------------
 -                    -  exprTrigD is a function which deals with the parsing
 -                    -  of trigonometic functions.
 -                    -  More specifically, it is able to parse:
 -                    -    - Sine   (Sin)
 -                    -    - Cosine (Cos)
 -                    -}
exprTrigF :: Parser (Expr Float)
exprTrigF = do {
               x <- symbol "Cos" <|> symbol "Sin";
               xs <- between (symbol "(") (symbol ")") (exprF);

               if x == "Cos" then
                 return (Cos xs);
               else
                 return (Sin xs);
             }

{-
 - ----------------------------------------------------
 -                    exprExpD
 -                    ----------------------------------------------------
 -                    - exprExpD is a function which deals with the parsing
 -                    - of exponential functions and nearby entities.
 -                    -  More specifically, it is able to parse:
 -                    -    - Natural Exponentials (e)
 -                    -    - Natural Logarithms   (ln)
 -                    -    - Logarithms          (log)
 -                    -}
exprExpF :: Parser (Expr Float)
exprExpF = do {
               x <- symbol "Ln" <|> symbol "Log" <|> symbol "Exp";
               xs <- between (symbol "(") (symbol ")") (exprF);


               if x == "Ln" then
                 return (Ln ss);
               else if x == "Log" then
                 return (Log xs);
               else
                 return (Exp xs);
             }

exprConstF :: Parser (Expr Float)
exprConstF = do {
               symbol "Constant";
               xs <- float;
               return (Const xs);
             }

exprOpF :: Parser (Expr Float)
exprOpF = do {
                x <- symbol "Add" <|> symbol "Mult";
                xs <- between (symbol "(") (symbol ")") (exprVar <|> exprConstF <|> exprOpF);
                xs' <- between (symbol "(") (symbol ")") (exprVar <|> exprConstF <|> exprOpF);
                {-
 -                 ----------------------------------------------------
 -                                                         NOTE
 -                                                                         ----------------------------------------------------
 -                                                                                           This parser can only have the option of
 -                                                                                                             adding or multiplying, so it's necessary
 -                                                                                                                               to check whether the initial input was
 -                                                                                                                                                 "Add" or "Mult", and return the correct
 -                                                                                                                                                                   result accordingly
 -                                                                                                                                                                                   -}
                if x == "Add" then
                  return (Add xs xs'); -- Initial s is "Add", return Add
                else -- The only other option is to return "Mult", since it wasn't "Add"
                  return (Mult xs xs')
              }




                {-           
 -                           ----------------------------------------------------
 -                                                           Expr Parsing (General)
 -                                                                           ---------------------------------------------------- 
 -                                                                                           -}
exprVar :: Parser (Expr a) -- Abstracted and available for use whether for float values or double
exprVar = do {
               symbol "Var";
               xs <- many1 letter;
               return (Var ss);
             }



{-                
 -                                ----------------------------------------------------
 -                                                                        Utility Parsers
 -                                                                                        ----------------------------------------------------
 -                                                                                        -}
parens :: Parser a -> Parser a
parens p = do { char '(';
               cs <- p;
               char ')';
               return cs }

symbol :: String -> Parser String
symbol xs = let
 symbol' :: Parser String
 symbol' = do { spaces;
                xs' <- string xs;
                spaces;
                return xs' }
 in try symbol'

removeRight (Right xs) = xs

digits :: Parser String
digits = many1 digit

negDigits :: Parser String
negDigits = do { neg <- symbol "-";
                dig <- digits;
                return (neg ++ dig) }

integer :: Parser Integer
integer = fmap read $ try negDigits <|> digits

decimalDigits :: Parser String
decimalDigits = do { d <- char '.';
                     rm <- digits;
                     return $ d:rm }

decimalDigits' :: Parser String
decimalDigits' = do { ds <- try negDigits <|> digits;
                   rs <- try decimalDigits <|> return "";
                   return $ ds ++ rs }

double :: Parser Double
double = fmap read $ decimalDigits'

float :: Parser Float
float = fmap read $ decimalDigits'
