# Portafolio

![Portafolio](https://imgur.com/9bdb488a-58d0-45e3-9706-2948d0dc9b22)

Portafolio is phoenix boilerplate to make web application. It comes with admin panel for administrator and front end auth for user.





## To start:

  * Install dependencies with `mix deps.get`
  * Check your database setting at `config/dev.exs` and match your postgresql credential
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Run seed `mix run priv/repo/seeds.exs` (if you are from asset folder, dont forget to back to root project folder `cd ..`)
  * Start Phoenix endpoint with `mix phx.server`

### For User
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
You can register as a regular user.

### For Admin
You can visit [`localhost:4000/admin`](http://localhost:4000/admin) and login using username 'administrator' and passsword 'administrator'


### TODO

- [ ] Show accurate data in dashboard.
- [ ] Ability to edit Avatar
- [ ] Ability to edit Model Data
- [ ] Search and Filter Model
- [ ] Waive username
- [ ] Add stagename [??]
- [ ] 

