<template>
  <div>
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
export default {
  data() {
    return {
      users: []
    }
  },
  methods: {
    fetchUsers() {
      fetch('/users')
      .then(response => response.json())
      .then(users => this.users = users);
    }
  }
}
</script>
