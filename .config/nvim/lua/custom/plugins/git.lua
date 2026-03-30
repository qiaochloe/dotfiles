return {
  { -- Git gutters and git hunks
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true }) end

        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gs.nav_hunk 'next'
          end
        end, 'Next hunk')
        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gs.nav_hunk 'prev'
          end
        end, 'Prev hunk')
        map('n', ']H', function() gs.nav_hunk 'last' end, 'Last hunk')
        map('n', '[H', function() gs.nav_hunk 'first' end, 'First hunk')
        map({ 'n', 'x' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage hunk')
        map({ 'n', 'x' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset hunk')
        map('n', '<leader>ghS', gs.stage_buffer, 'Stage buffer')
        map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo stage hunk')
        map('n', '<leader>ghR', gs.reset_buffer, 'Reset buffer')
        map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview hunk inline')
        map('n', '<leader>ghb', function() gs.blame_line { full = true } end, 'Blame line')
        map('n', '<leader>ghB', function() gs.blame() end, 'Blame buffer')
        map('n', '<leader>ghd', gs.diffthis, 'Diff this')
        map('n', '<leader>ghD', function() gs.diffthis '~' end, 'Diff this ~')
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns select hunk')
      end,
    },
  },

  { -- Git utilities
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      gh = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = { enabled = true },
    },
    keys = {
      { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git branch' },
      { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git log' },
      { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git log line' },
      { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git status' },
      { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git stash' },
      { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git diff hunks' },
      { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git log file' },
      { '<leader>gi', function() Snacks.picker.gh_issue() end, desc = 'GitHub issues (open)' },
      { '<leader>gI', function() Snacks.picker.gh_issue { state = 'all' } end, desc = 'GitHub issues (all)' },
      { '<leader>gp', function() Snacks.picker.gh_pr() end, desc = 'GitHub pull requests (open)' },
      { '<leader>gP', function() Snacks.picker.gh_pr { state = 'all' } end, desc = 'GitHub pull requests (all)' },
      { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git browse', mode = { 'n', 'v' } },
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
    },
  },
}
