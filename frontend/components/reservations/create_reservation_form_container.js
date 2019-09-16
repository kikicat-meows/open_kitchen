import { connect } from 'react-redux';

import ReservationForm from './reservation_form';
import { createReservation } from '../../actions/reservations_actions'

const mapStateToProps = (state, { location }) => {
  let kitchenId = new URLSearchParams(location.search).get('kitchenId');
  let timeSlotId = new URLSearchParams(location.search).get('timeSlotId');

  return {
    form: {
      userId: state.session.currentUserId,
      kitchenId: kitchenId,
      timeSlotId: timeSlotId,
      date: state.search.date,
      party_size: state.search.party_size
    },
    time: new URLSearchParams(location.search).get('time'),
    kitchen: state.entities.kitchens[kitchenId],
    formType: "Make Reservation"
  }
};

const mapDispatchToProps = dispatch => {
  return {
    action: (reservation) => dispatch(createReservation(reservation))
  }
};

export default connect(mapStateToProps, mapDispatchToProps)(ReservationForm);