<template>
  <v-container fluid classfill-height>
    <Navbar />
    <v-row>
      <v-col>
        <v-container fluid grid-list-md>
          <v-layout row wrap>
            <v-flex v-for="category in categories" :key="category" v-bind="xs6">
              <v-card class="tile" color="#1976D2" dark justify="center">
                <v-container fill-height fluid pa-2>
                  <v-layout fill-height align-center>
                    <v-flex xs12 align-end flexbox>
                      <span v-text="category" class="text-uppercase"></span>
                    </v-flex>
                  </v-layout>
                </v-container>
              </v-card>
            </v-flex>
          </v-layout>
        </v-container>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Navbar from "./generic/Navbar";
export default {
  name: "Home",
  components: {
    Navbar,
  },
  data() {
    return {
      categories: ["Birds", "Animals", "Flags"],
    };
  },
};
</script>

<style scoped>
.tile {
  color: blue;
  font-weight: bold;
  text-align: center;
  height: 15vw;
}
</style>
