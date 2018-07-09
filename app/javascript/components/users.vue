<template>
  <div>
    <h2>New User</h2>

     <form>
      <label for="user-name">Name</label>
      <input type="name" v-model="name"/>
      <label for="user-email">Email</label>
      <input type="email" v-model="email"/>
      <button v-on:click.prevent="createUser">Create</button>
    </form>

    <h2>Users</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <tr v-for="user in users">
            <td>{{ user.name }}</td>
            <td>{{ user.email }}</td>
        </tr>
    </table>
    <button v-on:click="fetchUsers">Refresh</button>
  </div>
</template>

<script>
const getCSRFToken = () => document.querySelector('meta[name="csrf-token"]').getAttribute('content');

export default {
  data() {
    return {
      users: [],
      name: '',
      email: '',
    }
  },
  methods: {
    fetchUsers() {
      fetch('/users')
      .then(response => response.json())
      .then(users => this.users = users)
    },
    createUser() {
      fetch(
        '/users',
        {
          method: 'POST',
          credentials: "same-origin",
          headers: {
             'X-CSRF-Token': getCSRFToken(),
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            user: {
              email: this.email,
              name: this.name
            }
          })
        }
      )
      .then(response => response.json())
      .then(user => this.users = [user, ...this.users])
    }
  }
}
</script>
