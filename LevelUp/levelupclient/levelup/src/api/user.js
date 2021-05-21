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


const getNextQuestion= async(userName)=>{
  const config={
    userName:userName
  };

  const response = await axios.post('http://localhost:7071/api/GetNextQuestion',config);
  return response;
}


export {
    getLeaderBoard,getNextQuestion
}