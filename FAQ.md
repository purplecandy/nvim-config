# Neovim FAQ - Code Editing & Manipulation

Frequently asked questions about editing and manipulating code in this Neovim setup.

---

## Navigation & Movement

### Q: How do I go to a function's definition?

**A:** Put your cursor on the function/variable name and press:
- **`gd`** - Go to definition
- **`Space + g + d`** - Alternative go to definition

**Other navigation shortcuts:**
- **`gD`** - Go to declaration
- **`Space + g + r`** - Show all references
- **`Space + g + t`** - Go to type definition

---

### Q: How do I jump back to my previous location (like browser back button)?

**A:** Use the jump list navigation:
- **`Ctrl + o`** - Jump back (older position)
- **`Ctrl + i`** - Jump forward (newer position)

**Example workflow:**
1. You're on line 50
2. Press `gd` to jump to definition
3. Press `Ctrl + o` to go back to line 50
4. Press `Ctrl + i` to go forward to the definition again

**Other useful jumps:**
- **`:jumps`** - View your jump history
- **`g;`** - Go to last edit location
- **`g,`** - Go forward in edit history
- **`` ` ` ``** (backtick twice) - Jump to last position

---

### Q: How do I switch between open files (tabs/buffers)?

**A:** Navigate between buffers using:
- **`Tab`** - Next buffer
- **`Shift + Tab`** - Previous buffer
- **`Space + f + b`** - Show all buffers in Telescope (fuzzy finder)
- **`Space + w`** - Close current buffer

The bufferline at the top shows all your open files like tabs.

---

## Code Editing

### Q: How do I copy and paste?

**A:** In normal mode:

**Copy (yank):**
- **`yy`** - Copy entire line
- **`y` + motion** - Copy with motion (e.g., `yiw` = copy word, `y$` = copy to end of line)
- In visual mode: Select text with `v`, then **`y`** to copy

**Paste:**
- **`p`** - Paste after cursor
- **`P`** - Paste before cursor

**Note:** This config uses system clipboard automatically, so anything you copy in Neovim is available in other apps (Cmd+V) and vice versa!

---

### Q: How do I undo and redo?

**A:**
- **`u`** - Undo
- **`Ctrl + r`** - Redo

Simple and fast! Your hands stay on the home row.

---

### Q: How do I collapse/expand code blocks (code folding)?

**A:** Folding shortcuts:

**Basic folding:**
- **`Space + f + c`** - Close/collapse fold under cursor
- **`Space + f + o`** - Open/expand fold under cursor
- **`Space + f + a`** - Toggle fold (open if closed, close if open)

**Fold all:**
- **`Space + f + C`** - Close ALL folds in file
- **`Space + f + O`** - Open ALL folds in file

**Traditional vim shortcuts (also work):**
- **`za`** - Toggle fold
- **`zc`** - Close fold
- **`zo`** - Open fold
- **`zM`** - Close all folds
- **`zR`** - Open all folds

When you collapse a fold, you'll see inline text like: `function myFunction() { ... 15 lines }`

---

## Code Intelligence

### Q: How do I view documentation for a function?

**A:** Put your cursor on the function name and press:

**`K`** (capital K)

This will show:
- Function signature
- Parameter types
- Return type
- JSDoc/TSDoc comments
- Type definitions

**Example:** Put cursor on `console.log` and press `K` to see its TypeScript documentation.

**Note:** Make sure you're in Normal mode (press `Esc` first if needed).

---

### Q: How do I manually open the autocomplete suggestions?

**A:** While typing, press:

**In Terminal Neovim:**
- **`Ctrl + .`** - Open autocomplete menu
- **`Ctrl + Space`** - Alternative (might conflict with macOS)

**In GUI Neovim (Neovide, VimR):**
- **`Cmd + .`** - Open autocomplete menu

**Navigating the menu:**
- **`Ctrl + j`** / **`Ctrl + k`** - Move down/up
- **`Tab`** / **`Shift + Tab`** - Also navigate
- **`Enter`** - Accept selection
- **`Ctrl + e`** - Close menu

**Example:** Type `console.` then press `Ctrl + .` to see all available methods.

---

### Q: How do I use code actions (like the bulb icon in VS Code)?

**A:** Put your cursor on underlined code (errors/warnings) and press:

**`Space + c + a`** - Show code actions

**Common use cases:**

**1. Auto-import missing imports:**
```typescript
useState()  // underlined - not imported
```
- Cursor on `useState`
- Press `Space + c + a`
- Select "Import from 'react'"

**2. Quick fixes for warnings:**
```typescript
const x = 10  // Warning: unused variable
```
- Cursor on `x`
- Press `Space + c + a`
- Select fix option

**3. Refactoring:**
- Select code in visual mode (`v`)
- Press `Space + c + a`
- See options like "Extract to function", "Extract to constant"

**Related shortcuts:**
- **`Space + s + o`** - Organize/remove unused imports
- **`Space + rn`** or **`F2`** - Rename symbol
- **`[d`** / **`]d`** - Jump to previous/next diagnostic

---

## Save Operations

### Q: How do I save files?

**A:** Multiple save options:

**Quick save:**
- **`Ctrl + S`** - Save current file

**Save with actions:**
- **`Space + s + s`** - Just save
- **`Space + s + a`** - Save all files
- **`Space + s + f`** - Format with Prettier and save
- **`Space + s + l`** - Lint (ESLint), format, and save (full cleanup)
- **`Space + s + o`** - Organize imports and save

**Tip:** Use `Space + s + l` for complete code cleanup before committing!

---

## Finding Things

### Q: How do I search for symbols/functions in the current file?

**A:**
- **`Space + t`** - Find symbols in current file (functions, classes, variables)
- **`Space + Shift + T`** - Find symbols across entire workspace

This shows a fuzzy-finder list of all symbols. Type to filter, press Enter to jump.

---

### Q: How do I find files or search in project?

**A:** Telescope shortcuts:

**Find files:**
- **`Ctrl + P`** - Quick file finder
- **`Space + f + f`** - Alternative file finder

**Search in project:**
- **`Ctrl + F`** - Search text in all files (live grep)
- **`Space + f + s`** - Alternative project search

**Other useful finds:**
- **`Space + f + r`** - Recently opened files
- **`Space + f + b`** - List open buffers
- **`Space + f + c`** - Find word under cursor in project

---

## Modes & Getting Unstuck

### Q: I'm stuck in a weird mode! How do I escape/reset?

**A:** Universal escape:

**`Esc`** or **`jk`** (press j then k quickly)

This takes you back to **Normal Mode**.

**How to know what mode you're in:**

Look at bottom-left of screen:
- `-- INSERT --` = Insert mode (typing)
- `-- VISUAL --` = Visual mode (selecting)
- `-- VISUAL LINE --` = Visual line mode
- Nothing = Normal mode

**Quick reset combo:**
1. Press `Esc` a few times
2. Then press `i` to start typing

**Common scenarios:**
- **Can't type?** → Press `i` to enter Insert mode
- **Text highlighted?** → Press `Esc` to exit Visual mode
- **See `:` at bottom?** → Press `Esc` to cancel Command mode

---

## Why Relative Line Numbers?

### Q: What's the benefit of relative line numbers?

**A:** Relative numbers show the **distance** to any line from your cursor, making vertical navigation super fast:

**Example:**
```
  3  │ function foo() {
  2  │   const x = 10;
  1  │   const y = 20;
 15  │   return x + y;  ← Your cursor
  1  │ }
  2  │
  3  │ function bar() {
```

**Quick movements:**
- Go 3 lines up? → **`3k`**
- Delete 5 lines down? → **`d5j`**
- Select 2 lines down? → **`V2j`**

**Benefits:**
- No mental math needed
- Fast vertical navigation
- Efficient code operations

**Note:** Not as useful if you mainly use mouse/Ctrl+P for navigation. It's personal preference!

---

## Git Integration

### Q: How do I see who last changed a line (Git Blame)?

**A:** Git blame is enabled by default!

**Inline blame (automatic):**
- After 500ms on any line, you'll see: `Author Name, 2025-01-09 - Commit message`

**Manual controls:**
- **`Space + h + B`** - Toggle inline blame on/off
- **`Space + h + b`** - Show full blame in popup

**Other git shortcuts:**
- **`]c`** / **`[c`** - Jump to next/previous git change
- **`Space + h + p`** - Preview git changes
- **`Space + h + s`** - Stage current hunk
- **`Space + h + r`** - Reset current hunk

---

## Productivity Tips

### Q: What are some essential productivity shortcuts I should know?

**A:** Most important shortcuts to memorize:

**Navigation:**
- `gd` - Go to definition
- `Ctrl + o` / `Ctrl + i` - Back/forward in jump history
- `Ctrl + P` - Find files

**Editing:**
- `Space + c + a` - Code actions (auto-import, refactor)
- `Space + s + l` - Save, lint, and format
- `F2` or `Space + rn` - Rename symbol

**Information:**
- `K` - Show documentation
- `Space + t` - Find symbols

**File tree:**
- `Space + e + e` - Toggle file explorer

**Quit:**
- `Space + q + q` - Quit and save session
- `Ctrl + Q` - Quick quit

**Bonus tips:**
- Use `Ctrl + .` often for autocomplete
- Use `Space + s + o` to clean up imports
- Jump to errors with `]d` / `[d`

---

## Additional Resources

- **View all keybindings:** Press `Space` and wait for which-key popup
- **LSP status:** `:LspInfo`
- **Plugin manager:** `:Lazy`
- **Mason (LSP installer):** `:Mason`
- **Treesitter status:** `:TSInstall` or `:TSUpdate`

---

*Last updated: 2025-01-09*
