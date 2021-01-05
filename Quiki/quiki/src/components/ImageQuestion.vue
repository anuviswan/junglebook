<template>
  <v-container fluid classfill-height>
    <Navbar />
    <v-row>
      <v-col>
        <v-card class="mx-auto" elevation="12" raised max-width="95vw">
          <v-img height="70vh" v-bind:src="getImageUrl" contain> </v-img>
          <v-card-title>{{ this.title }}</v-card-title>
          <v-divider v-if="description" />
          <v-card-subtitle class="pb-0" v-if="description">
            {{ this.description }}
          </v-card-subtitle>
          <v-divider v-if="funfact" />
          <v-card-subtitle class="pb-0" v-if="funfact">
            {{ this.funfact }}
          </v-card-subtitle>
          <v-divider />
          <v-card-actions>
            <v-spacer />
            <v-btn
              color="primary darken-2"
              text
              rounded
              depressed
              @click.prevent="nextQuestion"
            >
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
import { mapActions } from "vuex";
export default {
  name: "ImageQuestion",
  components: {
    Navbar,
  },
  computed: {
    getImageUrl() {
      console.log("computing new url");
      return this.imageUrl;
    },
  },
  data() {
    return {
      imageUrl: "",
      title: "Unknown",
      description: "",
      categoryId: "",
      funfact: "",
    };
  },
  methods: {
    ...mapActions(["updateCategory"]),
    async nextQuestion() {
      const item = await getRandomItem(this.categoryId);
      console.log(item);
      this.imageUrl = item.url;
      this.title = item.key;
      this.description = item.description;
      console.log(this.imageUrl);
    },
  },
  async created() {
    this.categoryId = this.$route.params.category;
    this.updateCategory(this.categoryId);
    const item = await getRandomItem(this.categoryId);
    console.log(item);

    this.imageUrl = item.url;
    this.title = item.key;
    this.description = item.description;
    this.funfact = item.funfact;
    console.log(this.imageUrl);
    console.log(this.funfact);
  },
};
</script>

<style></style>
