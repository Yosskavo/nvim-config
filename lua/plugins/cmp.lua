-- ~/.config/nvim/lua/plugins/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<S-CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },

  window = {
    -- leave empty bordered windows; Noice handles the scrolling and max height
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- shorten long items to keep popup compact
      if #vim_item.abbr > 30 then
        vim_item.abbr = string.sub(vim_item.abbr, 1, 27) .. "..."
      end
      return vim_item
    end,
  },

  experimental = {
    ghost_text = true,       -- optional inline suggestion like VSCode
    native_menu = false,     -- disables default popup; lets Noice render it
  },
})
