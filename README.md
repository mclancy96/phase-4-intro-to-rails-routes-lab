# Rails Routes Lab

Welcome to the Rails Routes Practice Lab!

## Setup Instructions

1. **Install dependencies:**

   ```sh
   bundle install
   ```
2. **Run the server:**

   ```sh
   bin/rails server
   ```

   Visit [http://localhost:3000](http://localhost:3000) in your browser.
3. **Run the test suite:**

   ```sh
   bundle exec rspec
   ```

## Your Task

- Create a `PagesController` with actions `about` and `contact`.
- Add routes `/about` and `/contact` that point to these actions.
- Create simple views for each action with the text “About Page” and “Contact Page”.

## Example Steps


## Example Steps

1. Generate the controller:
   ```sh
   bin/rails generate controller Pages about contact
   ```
2. Add routes in `config/routes.rb`:
   ```ruby
   get "/about", to: "pages#about"
   get "/contact", to: "pages#contact"
   ```
3. Edit the views:
   - `app/views/pages/about.html.erb`: `About Page`
   - `app/views/pages/contact.html.erb`: `Contact Page`

**Do not use `scaffold` for this lab.**

## RSpec Test

Tests are provided to check that `/about` and `/contact` return 200 and the correct text.

---

Happy coding!
