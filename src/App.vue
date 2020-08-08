
<template>
  <div>
    <app-title></app-title>
    <app-singlePlayer v-if="singlePlayerMode"></app-singlePlayer>

    <component :is="Title"></component>
  </div>
</template>


<script>
import Title from "./components/Title.vue";
import SinglePlayer from "./components/SinglePlayer.vue";

export default {
  data: function() {
    return {
      singlePlayerMode: false,
    };
  },
  components: {
    appTitle: Title,
    appSinglePlayer: SinglePlayer
  },
  methods: {
    singlePlayer() {
      this.SinglePlayerMode = true;
    }
  }
  
};
</script>
<style>
body,
html {
  background-color: green;
}
</style>
