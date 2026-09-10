return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "w",
      function()
        require("spider").motion("w")
      end,
      mode = { "n", "x", "o" },
      desc = "Next subword",
    },
    {
      "e",
      function()
        require("spider").motion("e")
      end,
      mode = { "n", "x", "o" },
      desc = "End of subword",
    },
    {
      "b",
      function()
        require("spider").motion("b")
      end,
      mode = { "n", "x", "o" },
      desc = "Prev subword",
    },
    {
      "ge",
      function()
        require("spider").motion("ge")
      end,
      mode = { "n", "x", "o" },
      desc = "End of prev subword",
    },
  },
}
