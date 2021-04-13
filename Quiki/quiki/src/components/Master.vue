<template>
  <v-container fluid fill-height>
    <v-layout align-center justify-center>
      <v-flex xs12 sm8 md4>
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title>Admin Panel</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form v-on:submit.prevent="onSubmit">
              <v-text-field
                prepend-icon="mdi-account"
                name="login"
                v-model="userName"
                type="text"
              ></v-text-field>
              <v-text-field
                id="password"
                prepend-icon="mdi-lock"
                name="password"
                v-model="passKey"
                type="password"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="onSubmit">Login</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { validate } from "../api/httpUtil";
export default {
  name: "Master",
  data() {
    return {
      userName: "",
      passKey: "",
    };
  },
  methods: {
    async onSubmit(e) {
      e.preventDefault();
      var response = await validate(this.userName, this.passKey);
      if (response.userAuthentication) {
        this.$router.push("./dashboard");
      }
    },
  },
};
</script>

<style></style>
