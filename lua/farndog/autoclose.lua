require("autoclose").setup({
   options = {
      disable_when_touch = true,
   },
   keys = {
      ["'"] = { escape = false, close = false, pair = "''"  },
   }
})
