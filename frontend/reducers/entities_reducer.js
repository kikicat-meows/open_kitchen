import { combineReducers } from 'redux';
import usersReducer from './users_reducer';
import kitchensReducer from './kitchens_reducer';

const entitiesReducer = combineReducers({
  users: usersReducer,
  kitchens: kitchensReducer
});

export default entitiesReducer;