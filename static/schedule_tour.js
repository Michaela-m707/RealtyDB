document.addEventListener('DOMContentLoaded', function () {
    document.addEventListener('click', function (event) {
        console.log('Clicked!');
        if (event.target && event.target.classList.contains('btn-primary')) {
            // Get the modal that contains the confirm button
            const modal = event.target.closest('.modal');
            if (modal) {
                const recipientName = modal.querySelector('#recipient-name').value;
                const recipientEmail = modal.querySelector('#recipient-email').value;
                const phoneNumber = modal.querySelector('#phone-number').value;
                const message = modal.querySelector('#message-text').value;
                const propertyId = modal.getAttribute('data-property-id');
                
                $(modal).modal('hide');

                // Send the form data to the server using AJAX
                $.ajax({
                    url: '/schedule_tour',
                    method: 'POST',
                    data: {
                        recipient_name: recipientName,
                        recipient_email: recipientEmail,
                        phone_number: phoneNumber,
                        message: message,
                        property_id: propertyId // Include property ID in the data
                    },
                    success: function (response) {
                        // Handle success response
                        console.log(response);
                        alert('Tour scheduled successfully!');
                    },
                    error: function (xhr, status, error) {
                        // Handle error response
                        console.error(xhr.responseText);
                        alert('An error occurred while scheduling the tour.');
                    }
                });
            }
        }
    });
});
