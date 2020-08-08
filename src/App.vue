
<template>
  <div>
    <BlackJackTitle></BlackJackTitle>
    <SinglePlayer v-if="singlePlayerMode"></SinglePlayer>
  </div>
</template>


<script>
import BlackJackTitle from "./components/BlackJackTitle.vue";
import SinglePlayer from "./components/SinglePlayer.vue";

export default {
  data: function() {
    return {
      singlePlayerMode: false,
    };
  },
  components: {
   BlackJackTitle,
   SinglePlayer
  },
  methods: {
    singlePlayer() {
      this.SinglePlayerMode = true;
    }
  },
  
};
</script>
<style>
body,
html {
  background-color: green;
}
</style>
