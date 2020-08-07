export default {
  
  data() {
    return {
      cardsInHand: [],
    };
  },
  mounted() {
    // API call
    this.fetchcards();
  },
  methods: {
    fetchcards(){
      fetch(
      "https://deckofcardsapi.com/api/deck/<<new>>/draw/?count=2"
    )
      .then(function(response) {
        return response.json();
      })
      .then(function(json_data) {
        //console.log(typeof(json_data))
        this.cardsInHand = json_data.cardsInHand
      });
    }
  }
};