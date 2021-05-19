import axios from "axios";

// Leadership Board
const getLeaderBoard = async () => {

    const config = {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        }
      };

  const response = await axios.post(
    "http://localhost:7071/api/GetScores",config
  );

  return response;
};


export {
    getLeaderBoard
}