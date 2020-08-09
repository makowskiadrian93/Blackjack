<template>
  <div class="baseBar">
    <section>
      <div>
          <h2 class="baseBar">♠ ♥ ♦ ♣</h2>
         <div class="newGameButton">
      <button @click="newGame">NOWA GRA</button>
    </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
data: function() {

},
}
 methods: {
    newGame() {
      this.singlePlayerMode = false;
      this.multiPlayerMode = false
    },

 }

</script>
<style scoped>
.baseBar {
  display: grid;
  grid-template-columns: auto;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 2rem;
  text-align: center;
}

</style>