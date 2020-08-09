<template>
  <div class="display">
    <section>
      <div class="players"></div>
      <div class="playerName">
        GRACZ 1
        <div>Wynik:</div>
      </div>
      <div class="optionButtons">
        <button @click="fetchStartingCards">ZACZNIJ</button>
        <button @click="fetchOneCard">DOBIERZ</button>
        <button @click="passTurn">PASS</button>
      </div>
      <div v-for="card in startingCards" :key="card.cards">KARTY: {{ card.cards }}</div> 
    
    </section>
    <section>
      <div></div>
      <div class="playerName">
        KRUPIER
        <div>Wynik:</div>
      </div>
      <div class="optionButtons">
        <button>-</button>
        <button>-</button>
        <button>-</button>
      </div>
      <div>{{ startingCards2 }}</div>
    </section>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      startingCards: [],
      startingCards2: [],
      playerOnePass: false,
      playerTwoPass: false
    };
  },
  methods: {
    passTurn() {
      this.playerOnePass = true;
      if(this.startingCards.value > 21) {
alert('GRACZ 2 WYGRAŁ') } else if(this.startingCards.value > this.startingCards2.value) {
  alert('GRACZ 1 WYGRAŁ')
}}, 
    addStartingCards(twoCards) {
      this.startingCards.push(twoCards);
    },

    addStartingCards2(twoCards2) {
      this.startingCards2.push(twoCards2);
    },
    fetchStartingCards() {
      let promise = fetch(
         "https://deckofcardsapi.com/api/deck/qzmt8424senh/draw/?count=2"
      );
      promise
        .then(cards => {
          return cards.json();
        })
        .then(cardsObject => {
          this.startingCards.push(cardsObject);
        });
    },
    fetchStartingCards2() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/qzmt8424senh/draw/?count=2"
      );
      promise
        .then(cards2 => {
          return cards2.json();
        })
        .then(cardsObject => {
          this.startingCards2.push(cardsObject);
        });
    },
    addNewCard(oneCard) {
      this.startingCards.push(oneCard);
    },
    fetchOneCard() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/qzmt8424senh/draw/?count=1"
      );
      promise
        .then(cards3 => {
          return cards3.json();
        })
        .then(cardsObject3 => {
          this.startingCards.push(cardsObject3);
        });
    }
  }
};
</script>
<style scoped>
.display {
  display: grid;
  grid-template-columns: 50% 50%;
  background-color: olivedrab;
}
.players {
  background-color: olivedrab;
  font-family: Arial, Helvetica, sans-serif;
}
.playerName {
  background-color: rgb(4, 141, 141);
  color: black;
  font-family: sans-serif;
  font-size: 1rem;
  text-align: center;
}
.optionButtons {
  display: grid;
  grid-template-columns: 33% 33% 33%;
}
</style>