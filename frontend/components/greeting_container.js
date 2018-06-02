import { login,signup } from '../actions/session_actions';
const mapStateToProps = ({ entities, session}) => ({
  currentUser: entities.users[session.id]
});


const mapDispatchToProps = dispatch => ({

})
