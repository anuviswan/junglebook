<template>
  <v-card>
    <v-app-bar color="blue" dense dark>
      <v-toolbar-title color="white">Family Treasure Hunt </v-toolbar-title
      ><v-spacer></v-spacer>{{ currentUser.userName }}
    </v-app-bar>
  </v-card>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "AppBar",
  computed: mapGetters(["currentUser"]),
};
</script>

<style></style>
