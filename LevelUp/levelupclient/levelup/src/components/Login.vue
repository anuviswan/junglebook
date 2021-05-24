<template>
  <v-card>
    <v-form v-model="valid" @submit="onSubmit">
      <v-container>
        <v-row>
          <v-col cols="12">
            <v-banner single-line color="blue" elevation="4" rounded dark
              >Let the hunt begin</v-banner
            >
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="12">
            <v-text-field
              v-model="userName"
              :rules="nameRules"
              label="Username"
              required
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col><v-btn color="blue" type="submit" dark>Login</v-btn> </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-card>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "Login",
  data: () => ({
    valid: false,
    userName: "",
    nameRules: [(v) => !!v || "Name is required"],
  }),
  methods: {
    ...mapActions(["updateCurrentUser"]),
    onSubmit(e) {
      e.preventDefault();
      console.log("submitting");
      console.log(this.userName);
      this.updateCurrentUser({
        userName: this.userName,
      });
      this.$router.push("question");
    },
  },
};
</script>

<style></style>
