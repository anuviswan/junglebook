<template>
  <v-container fluid classfill-height>
    <Navbar />
    <v-row>
      <v-col>
        <v-card class="tile" color="#1976D2" dark justify="center">
          <v-container fill-height fluid pa-2>
            <v-img
              v-bind:src="imageUrl"
              max-height="80vh"
              contain="false"
            ></v-img>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { getRandomItem } from "../api/httpUtil";
import Navbar from "../components/generic/Navbar";
export default {
  name: "ImageQuestion",
  components: {
    Navbar,
  },
  data() {
    return {
      imageUrl: "",
    };
  },
  created() {
    var item = getRandomItem("birds");
    console.log(item);
    this.imageUrl = item.url;
    console.log(this.imageUrl);
  },
};
</script>

<style></style>
