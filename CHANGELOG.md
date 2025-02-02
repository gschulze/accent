# Changelog

## v1.12.0

### 1. Enhancements

- Support RTL languages in webapp
- Add versions support in sync/add translation in webapp and CLI
- Optimize SQL batch operations to use Ecto placeholders
- CLI has a warning if 2 files in the config have the exact same folder
- Add GitHub Actions instructions in CLI Readme

### 2. Bug fixes

- Documents list action links does not slide to the left to put the delete button uner the cursor
- Fix `accent format --order-by` option
- Fix large number of concurrent HTTP requests in CLI sync

## v1.9.0

### 1. Enhancements

- Colorful file preview with highlight.js
- Machine translations on document and review items

### 2. Bug fixes

- Large review list values does not crash the browser

### 3. Refactor

- Update Elixir/erlang and EmberJS to latest version

## v1.8.0

### 1. Enhancements

- Comment deletion
- Add export advanced filters
- Add merge options on add translation to correct translation in the same operation
- Add default null option on new slave

### 2. Bug fixes

- Fix Sentry setup

### 3. Refactor

- Update Elixir/erlang and EmberJS to latest version
- Conflicts page item delays rendering to handle large list of large values

## v1.6.0

### 1. Enhancements

- New review page that includes more context on translations
- Add recent projects section in projects listing
- Add Resx 2.0 format
- Add batch activity support for batch activity (sync, add translations)
- Add markdown conversation
- Add file comment UI on a translation page

### 2. Bug fixes

- Fix slow textarea and text input
- Fix large strings textarea that broke the UI

### 3. Refactor

- Add type-safe Gleam language to build linting rules
- Replae homemade gen_stage async jobs processor with Oban
- Upgrade to latest Elixir and latest EmberJS
- Use animated svg for skeleton UI instead of plain CSS
