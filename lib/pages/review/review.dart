import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _chargingHubNameController =
      TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _reviewCollection =
      FirebaseFirestore.instance.collection('UserReviews');

  Future<void> _addReview() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _reviewCollection.add({
          'userId': currentUser.uid,
          'username': _usernameController.text.trim(),
          'chargingHubName': _chargingHubNameController.text.trim(),
          'review': _reviewController.text.trim(),
          'status': 'Pending',
          'location': _locationController.text.trim(),
          'timestamp': Timestamp.now(),
        });
        _usernameController.clear();
        _chargingHubNameController.clear();
        _reviewController.clear();
        _locationController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Review added successfully')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add review')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _reviewCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                final reviews = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review =
                        reviews[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text('Username: ${review['username']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Charging Hub Name: ${review['chargingHubName']}'),
                          Text('Review: ${review['review']}'),
                          Text('Status: ${review['status']}'),
                          Text('Location: ${review['location']}'),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextFormField(
                  controller: _chargingHubNameController,
                  decoration:
                      const InputDecoration(labelText: 'Charging Hub Name'),
                ),
                TextFormField(
                  controller: _reviewController,
                  decoration: const InputDecoration(labelText: 'Review'),
                  maxLines: null,
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _addReview,
                  child: const Text('Add Review'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
