[@@@ocaml.text "/*"]

(** Copyright 2021-2024, Kakadu and contributors *)

(** SPDX-License-Identifier: LGPL-3.0-or-later *)

[@@@ocaml.text "/*"]

type name = string

(** The main type for our AST (дерева абстрактного синтаксиса) *)
type 'name t =
  | Var of 'name (** Variable [x] *)
  | Abs of 'name * 'name t (** Abstraction [fun x -> t] *)
  | App of 'name t * 'name t (** Application [f g] *)
  | Int of int (** Integer constant *)
  | Add of 'name t * 'name t (** Addition [x + y] *)
  | Sub of 'name t * 'name t (** Substraction [x - y] *)
  | Mul of 'name t * 'name t (** Multiplication [x * y] *)
  | Div of 'name t * 'name t (** Devision [x / y] *)
  | Let of 'name * 'name t * 'name t (** Non-recursive let-binding [let x = y in z] *)
  | If of 'name t * 'name t * 'name t (** Condition [if x then y else z] *)

(** In type definition above the 3rd constructor is intentionally without documentation
    to test linter *)
