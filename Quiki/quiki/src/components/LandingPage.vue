<template>
  <v-container fluid class="primary" fill-height>
    <v-row>
      <v-col col-12>
        <Logo />
      </v-col>
    </v-row>
    <v-row>
      <v-col justify="center">
        <v-layout justify-center>
          <v-btn fab large color="white" outlined to="/home">
            <v-icon color="white">
              mdi-login
            </v-icon>
          </v-btn>
        </v-layout>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Logo from "./generic/Logo";
export default {
  name: "LandingPage",
  components: {
    Logo,
  },
};
</script>

<style></style>
