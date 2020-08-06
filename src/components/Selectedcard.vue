<template>

  <div>
      <div>"vue img"</div>
    <p>karta: {{ karta }}</p>
  </div>
</template>
<script>
export default {
  data: function() {
    return {
      karta: {
        // image: "https://deckofcardsapi.com/static/img/KH.png",
        value: "KING",
        suit: "HEARTS",
        code: "KH"
      }
    };
  }
};
</script>
<style scoped>
div {
  border: 1px solid blue;
  background-color: lightblue;
  padding: 30px;
  
  margin: 20px 20px;
  text-align: center;
  border-radius: 5px 5px 5px 5px;
}
</style>