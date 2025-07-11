-- opam install ocaml-lsp-server

---@type vim.lsp.Config
return {
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocamlinterface", "ocamllex", "dune", "menhir", "reason" },
}
