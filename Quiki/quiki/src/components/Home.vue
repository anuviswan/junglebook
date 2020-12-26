<template>
  <v-container fluid classfill-height>
    <v-app-bar app dark color="primary darken-2" rounded="true">
      <v-toolbar-title class="ml-2">
        <div class="logo">
          <i class="fa fa-superpowers fa-2x" aria-hidden="true"> Quiki</i>
        </div>
      </v-toolbar-title>
    </v-app-bar>
    <v-row>
      <v-col></v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "Home",
};
</script>

<style scoped>
.logo {
  color: white;
  font-family: "Eczar";
  font-size: 1vw;
  font-weight: bold;
  font-style: italic;
  text-align: center;
}
</style>
