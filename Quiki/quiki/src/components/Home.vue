<template>
  <v-container fluid classfill-height>
    <Navbar />
    <v-row>
      <v-col>
        <v-container fluid grid-list-md>
          <v-layout row wrap>
            <v-flex
              v-for="category in categories"
              :key="category.tile"
              size="6"
            >
              <v-card
                class="tile"
                color="#1976D2"
                dark
                justify="center"
                v-bind:to="`/q/${category.title}`"
              >
                <v-container fill-height fluid pa-2>
                  <v-layout fill-height align-center justify-center>
                    <i v-bind:class="category.icon" aria-hidden="true"
                      ><v-flex xs12 align-end flexbox>
                        <span
                          v-text="category.title"
                          class="text-uppercase"
                        ></span> </v-flex
                    ></i>
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
import { getCategories } from "../api/httpUtil";
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
  created() {
    this.categories = getCategories();
    console.log(this.categories);
  },
};
</script>

<style>
.tile {
  color: blue;
  font-weight: bold;
  text-align: center;
  height: 15vh;
}
</style>
