local snip_ft_path = "lemons.snippets.ft"

return {
    { "rust", require(snip_ft_path..".rust") },
    { "go", require(snip_ft_path..".go") },
    { "javascript", require(snip_ft_path..".javascript") }
}