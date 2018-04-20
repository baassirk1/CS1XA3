{- Expression Datatype
 - ----------------------------------------------------
 -                    Module ExprType
 -                    ----------------------------------------------------
 -                    -   Wraps different operations in an expression tree 
 -                    -   Ops Used are as follows (below):
 -                    ----------------------------------------------------
 -                    -     Add   --> standard binary addition
 -                    -     Mult  --> standard binary multiplication
 -                    -     Const --> wrapper for simple values
 -                    -     Var   --> string identifier for variables 
 -                    -}

module ExprType where

import Data.List


data Expr a = Add (Expr a) (Expr a) -- ^ Binary Addition
            | Mult (Expr a) (Expr a) -- ^ Binary Multiplication 
            | Const a -- ^ Wraps "a" as constant value
            | Var String -- ^ Wraps a variable identifier
            | Sin (Expr a) 
            | Cos (Expr a) 
            | Exp (Expr a)
            | Ln (Expr a) 
            | Neg (Expr a) -- ^ Negative value & wraps expression 
  deriving Eq


getVars :: Expr a -> [String]
getVars (Add e1 e2)  = getVars e1 `union` getVars e2
getVars (Mult e1 e2) = getVars e1 `union` getVars e2
getVars (Const _)    = []
getVars (Var iden)      = [iden]

