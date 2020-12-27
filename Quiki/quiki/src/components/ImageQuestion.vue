<template>
  <v-container fluid classfill-height>
    <Navbar />
    <v-row>
      <v-col>
        <v-card class="mx-auto" elevation="12" raised max-width="95vw">
          <v-img height="70vh" v-bind:src="imageUrl" contain> </v-img>
          <v-card-title>{{ this.title }}</v-card-title>
          <v-divider />
          <v-card-subtitle class="pb-0">
            {{ this.description }}
          </v-card-subtitle>
          <v-card-actions>
            <v-spacer />
            <v-btn color="primary darken-2" text rounded depressed>
              Next
            </v-btn>
          </v-card-actions>
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
      title: "Unknown",
      description: "",
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
