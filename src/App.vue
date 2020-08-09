<template>
  <div>
    <div class="title">
      <section>
        <h1>BLACKJACK</h1>
        <div class="startingButtons">
          <button @click="multiPlayer">DWÓCH GRACZY</button>
        </div>
        <h2 class="suits">♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦</h2>
      </section>
    </div>
    <MultiPlayer v-if="multiPlayerMode"></MultiPlayer>
    <div class="newGameButton">
      <button @click="newGame">NOWA GRA</button>
    </div>
  </div>
</template>


<script>
import MultiPlayer from "./components/MultiPlayer.vue";

export default {
  data: function () {
    return {
      singlePlayerMode: false,
      multiPlayerMode: false,
    };
  },
  components: {
    MultiPlayer,
  },
  methods: {
    newGame() {
      this.singlePlayerMode = false;
      this.multiPlayerMode = false;
    },
    multiPlayer() {
      console.log("rozpoczynamy multiPlayera");
      this.multiPlayerMode = true;
      this.singlePlayerMode = false;
    },
  },
};
</script>
<style>
body,
html {
  background-color: green;
  font-family: Arial, Helvetica, sans-serif;
}
.title {
  display: grid;
  grid-template-columns: auto;
  font-size: 2rem;
  text-align: center;
}
.suits {
  display: grid;
  grid-template-columns: auto;
  text-align: center;
}
.newGameButton {
  display: grid;
  grid-template-columns: 100%;
  margin-top: 2rem;
}
.startingButtons > button {
  width: 100%;
}

button {
  background-color: white;
  border-radius: .3rem;
  font-weight: 700;
  border: 3px solid black;
  height: 2.5rem;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 1.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

</style>
