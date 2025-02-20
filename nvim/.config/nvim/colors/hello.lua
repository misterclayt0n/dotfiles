-- Set the background option
vim.o.background = "dark"

-- Clear all highlights
vim.cmd [[highlight clear]]
if vim.o.syntax then
  vim.cmd [[syntax reset]]
end

-- Define the colorscheme name
vim.g.colors_name = "handmade-hero"

-- Define the HL function
local function HL(group, fg, bg, gui, guisp)
  -- Default values
  bg = bg or { gui = "NONE", cterm = "NONE" }
  gui = gui or ""
  guisp = guisp or nil

  -- Initialize highlight options
  local hl_options = {
    fg = fg.gui,
    bg = bg.gui,
    sp = guisp and guisp.gui,
    ctermfg = fg.cterm,
    ctermbg = bg.cterm,
  }

  -- Parse gui string for style attributes
  if gui then
    if gui:find "bold" then hl_options.bold = true end
    if gui:find "italic" then hl_options.italic = true end
    if gui:find "underline" then hl_options.underline = true end
    if gui:find "undercurl" then hl_options.undercurl = true end
    if gui:find "strikethrough" then hl_options.strikethrough = true end
    if gui:find "reverse" then hl_options.reverse = true end
  end

  -- Set highlight group
  vim.api.nvim_set_hl(0, group, hl_options)
end

-- Define colors
local back = { gui = "#161616", cterm = 233 }
local default = { gui = "#A08563", cterm = 137 }
local margin = { gui = "#262626", cterm = 235 }
local margin_hover = { gui = "#333333", cterm = 236 }
local margin_active = { gui = "#404040", cterm = 238 }
local cursor = { gui = "#40FF40", cterm = 83 }
local highlight = { gui = "#703419", cterm = 58 }
local at_highlight = { gui = "#CDAA7D", cterm = 180 }
local mark = { gui = "#808080", cterm = 244 }
local comment = { gui = "#7D7D7D", cterm = 244 }
local keyword = { gui = "#CD950C", cterm = 172 }
local constant = { gui = "#6B8E23", cterm = 64 }
local preproc = { gui = "#DAB98F", cterm = 180 }
local special = { gui = "#FF0000", cterm = 196 }
local bar = { gui = "#CACACA", cterm = 251 }
local bar_active = { gui = "#A8A8A8", cterm = 248 }
local base = { gui = "#000000", cterm = 16 }
local none = { gui = "NONE", cterm = "NONE" }
local underline = "underline"

-- Set highlight groups
HL("Normal", default, back)
HL("Visual", at_highlight, highlight)
HL("Search", at_highlight, highlight)
HL("IncSearch", at_highlight, highlight)
HL("VertSplit", margin_active, margin)
HL("ErrorMsg", special, back)
HL("LineNr", default, back)
HL("CursorLineNr", keyword, back)
HL("NonText", back, back)
HL("Cursor", back, cursor)
HL("Comment", comment)
HL("Todo", keyword, back)
HL("Statement", default)
HL("Conditional", default)
HL("Repeat", default)
HL("Label", default)
HL("Exception", default)
HL("Operator", default)
HL("Keyword", default)
HL("Identifier", { gui = "#CDAA7D", cterm = 180 }, back)
HL("Function", default)
HL("Special", default)
HL("PreProc", preproc)
HL("Include", preproc)
HL("Define", preproc)
HL("Macro", preproc)
HL("PreCondit", default)
HL("Constant", constant)
HL("Character", default)
HL("String", constant)
HL("Boolean", default)
HL("Number", default)
HL("Float", default)
HL("Type", default)
HL("StorageClass", default)
HL("Structure", default)
HL("Typedef", default)
HL("Pmenu", default, back)
HL("PmenuSel", at_highlight, highlight)
HL("TabLine", base, bar)
HL("TabLineSel", base, bar_active)
HL("TabLineFill", base, bar)
HL("markdownH1", keyword)
HL("markdownH2", keyword)
HL("markdownH3", keyword)
HL("markdownLinkText", keyword, back, "underline")
HL("CursorLine", default, back)
HL("SignColumn", default, back)
HL("NonText", back, back)
HL("ColorColumn", margin, back)
HL("SpecialKey", default, back)
HL("TabLine", base, bar)

-- LSP Highlights
HL("DiagnosticError", special, none)  -- Erros (vermelho)
HL("DiagnosticSignError", special, none)  -- Sinal de erro
HL("DiagnosticUnderlineError", special, none, "undercurl")  -- Sublinhado de erro

HL("DiagnosticWarn", keyword, none)  -- Avisos (amarelo)
HL("DiagnosticSignWarn", keyword, none)  -- Sinal de aviso
HL("DiagnosticUnderlineWarn", keyword, none, "undercurl")  -- Sublinhado de aviso

HL("DiagnosticInfo", constant, none)  -- Informações (verde)
HL("DiagnosticSignInfo", constant, none)  -- Sinal de informação
HL("DiagnosticUnderlineInfo", constant, none, "undercurl")  -- Sublinhado de informação

HL("DiagnosticHint", preproc, none)  -- Dicas (laranja)
HL("DiagnosticSignHint", preproc, none)  -- Sinal de dica
HL("DiagnosticUnderlineHint", preproc, none, "undercurl")  -- Sublinhado de dica

HL("DiagnosticUnnecessary", preproc, none, "underline")  -- Código desnecessário

-- Additional highlights for other groups
HL("ColorColumn", margin, back)  -- Coluna de cor
HL("Conceal", default, back)  -- Texto oculto
HL("CursorColumn", margin, back)  -- Coluna do cursor
HL("CursorLine", default, back)  -- Linha do cursor
HL("Delimiter", keyword, none)  -- Texto de diferenças
HL("Directory", keyword, none)  -- Nomes de diretórios
HL("DiffAdd", constant, none)  -- Diferenças adicionadas
HL("DiffChange", keyword, none)  -- Diferenças modificadas
HL("DiffDelete", special, none)  -- Diferenças removidas
HL("DiffText", keyword, none)  -- Texto de diferenças
HL("EndOfBuffer", margin, none)  -- Fim do buffer
HL("TermCursor", cursor, none)  -- Cursor no terminal
HL("ErrorMsg", special, back)  -- Mensagens de erro
HL("Folded", comment, margin)  -- Texto dobrado
HL("FoldColumn", comment, margin)  -- Coluna de dobra
HL("SignColumn", default, back)  -- Coluna de sinais
HL("MatchParen", default, highlight)  -- Parênteses correspondentes
HL("ModeMsg", default, none)  -- Mensagem de modo
HL("MoreMsg", default, none)  -- Mensagem de mais
HL("NonText", back, back)  -- Texto não visível
HL("NormalFloat", default, back)  -- Janelas flutuantes
HL("FloatBorder", margin, back)  -- Bordas de janelas flutuantes
HL("PmenuSbar", default, back)  -- Barra de rolagem do menu
HL("PmenuThumb", default, back)  -- Alça da barra de rolagem do menu
HL("Question", keyword, none)  -- Perguntas
HL("QuickFixLine", default, highlight)  -- Linha de correção rápida
HL("SpecialKey", default, none)  -- Teclas especiais
HL("SpellBad", special, none, "undercurl")  -- Erros de ortografia
HL("SpellCap", keyword, none, "undercurl")  -- Maiúsculas de ortografia
HL("SpellLocal", constant, none, "undercurl")  -- Ortografia local
HL("SpellRare", preproc, none, "undercurl")  -- Ortografia rara
HL("StatusLine", default, margin)  -- Barra de status
HL("StatusLineNC", comment, margin)  -- Barra de status (não ativa)
HL("TabLineFill", default, back)  -- Preenchimento da linha de abas
HL("Title", keyword, none)  -- Títulos
HL("VisualNOS", default, highlight)  -- Seleção visual (não ativa)
HL("WarningMsg", keyword, none)  -- Mensagens de aviso
HL("Whitespace", comment, none)  -- Espaços em branco
HL("WildMenu", default, highlight)  -- Menu de seleção
HL("Underlined", default, none, "underline")  -- Texto sublinhado
HL("Bold", default, none, "bold")  -- Texto em negrito
HL("Italic", default, none, "italic")  -- Texto em itálico

-- LspSaga floating windows
HL("SagaNormal", default, back)  -- Janelas flutuantes do LspSaga
HL("SagaBorder", margin, back)  -- Bordas das janelas flutuantes

-- Tree-sitter highlights
HL("@comment", comment, none)  -- Comentários
HL("@comment.documentation", constant, none, "italic")  -- Comentários de documentação
HL("@comment.luadoc", constant, none, "italic")  -- Comentários LuaDoc
HL("@error", special, none)  -- Erros de sintaxe
HL("@none", none, none)  -- Nenhum destaque
HL("@preproc", preproc, none)  -- Diretivas de pré-processador
HL("@define", preproc, none)  -- Definições de pré-processador
HL("@operator", default, none)  -- Operadores
HL("@punctuation.delimiter", default, none)  -- Delimitadores
HL("@punctuation.bracket", default, none)  -- Colchetes
HL("@punctuation.special", default, none)  -- Símbolos especiais
HL("@string", constant, none)  -- Strings
HL("@string.documentation", constant, none)  -- Strings de documentação
HL("@string.regex", constant, none)  -- Expressões regulares
HL("@string.escape", constant, none)  -- Sequências de escape
HL("@string.special", constant, none)  -- Strings especiais
HL("@character", constant, none)  -- Caracteres
HL("@character.special", constant, none)  -- Caracteres especiais
HL("@boolean", keyword, none)  -- Booleanos
HL("@number", constant, none)  -- Números
HL("@float", constant, none)  -- Números de ponto flutuante
HL("@function", default, none)  -- Funções
HL("@function.builtin", default, none)  -- Funções embutidas
HL("@function.macro", default, none)  -- Macros de função
HL("@method", default, none)  -- Métodos
HL("@constructor", default, none)  -- Construtores
HL("@parameter", default, none)  -- Parâmetros
HL("@keyword", default, none)  -- Palavras-chave
HL("@conditional", default, none)  -- Condicionais
HL("@repeat", default, none)  -- Repetições
HL("@debug", keyword, none)  -- Depuração
HL("@label", keyword, none)  -- Rótulos
HL("@type", default, none)  -- Tipos
HL("@type.builtin", default, none)  -- Tipos embutidos
HL("@type.definition", default, none)  -- Definições de tipo
HL("@storageclass", keyword, none)  -- Classes de armazenamento
HL("@field", default, none)  -- Campos
HL("@property", default, none)  -- Propriedades
HL("@variable", default, none)  -- Variáveis
HL("@variable.builtin", keyword, none)  -- Variáveis embutidas
HL("@constant", constant, none)  -- Constantes
HL("@constant.builtin", keyword, none)  -- Constantes embutidas
HL("@constant.macro", preproc, none)  -- Macros de constante
HL("@text", default, none)  -- Texto
HL("@text.strong", default, none, "bold")  -- Texto forte
HL("@text.emphasis", default, none, "italic")  -- Texto enfatizado
HL("@text.underline", default, none, "underline")  -- Texto sublinhado
HL("@text.strike", default, none, "strikethrough")  -- Texto riscado
HL("@text.title", keyword, none)  -- Títulos
HL("@text.literal", constant, none)  -- Texto literal
HL("@text.uri", constant, none, "underline")  -- URIs
HL("@text.reference", keyword, none)  -- Referências de texto
HL("@text.todo", keyword, back)  -- Tarefas (TODO)
HL("@text.note", keyword, none)  -- Notas
HL("@text.warning", keyword, none)  -- Avisos
HL("@text.danger", special, none)  -- Perigos
HL("@text.diff.add", constant, none)  -- Diferenças adicionadas
HL("@text.diff.delete", special, none)  -- Diferenças removidas
HL("@text.diff.change", keyword, none)  -- Diferenças modificadas
HL("@tag", keyword, none)  -- Tags
HL("@tag.attribute", default, none)  -- Atributos de tag
HL("@tag.delimiter", default, none)  -- Delimitadores de tag

-- Create autocommands
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "handmade-hero",
  callback = function()
    vim.api.nvim_set_hl(0, "Sneak", { link = "Search" })
    vim.api.nvim_set_hl(0, "SneakLabel", { link = "Search" })
  end,
})

-- Link multiple cursors
vim.api.nvim_set_hl(0, "multiple_cursors_cursor", { link = "Cursor" })
vim.api.nvim_set_hl(0, "multiple_cursors_visual", { link = "Visual" })
