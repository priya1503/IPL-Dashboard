import { React } from 'react';
import { Link } from 'react-router-dom';
import "./MatchSmallCard.scss";

export const MatchSmallCard = ({teamName, match}) => {
  if(!match) return null;
  const otherTeam = match.team1 === teamName ? match.team2: match.team1;
  const otherTeamRoute = `/team/${otherTeam}`;
  const isMatchWon = teamName === match.matchWinner;

  return (
    <div className={isMatchWon ? " won-card":" lost-card"}>
      <div className="MatchSmallCard">
      <span className="vs"> vs</span>
       <h1> 
        <Link to={otherTeamRoute}>{otherTeam}</Link>
      </h1>
       <p lassName="match-result">{match.result}</p>
      </div>
    </div>
    
  );
}

export default MatchSmallCard;