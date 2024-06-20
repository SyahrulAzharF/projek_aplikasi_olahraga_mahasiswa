import 'package:flutter/material.dart';

class CariUndangPage extends StatefulWidget {
  const CariUndangPage({Key? key}) : super(key: key);

  @override
  _CariUndangPageState createState() => _CariUndangPageState();
}

class _CariUndangPageState extends State<CariUndangPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allStudents = [
    'Alex Johnson',
    'Brenda Smith',
    'Charles Brown',
    'Diana Christensen',
    'Ethan Williams',
    'Fiona Taylor',
    'George Harris',
    'Hannah Martin',
    'Ian Clark',
    'Jane Doe'
  ];
  List<String> _foundStudents = [];
  List<String> _invitedFriends = []; // List to store invited friends

  @override
  void initState() {
    super.initState();
    _foundStudents = _allStudents; // Initially display all names
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allStudents;
    } else {
      results = _allStudents
          .where((student) =>
              student.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundStudents = results;
    });
  }

  void _sendInvite(String name) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Undangan Dikirim"),
        content: Text("Anda telah mengundang $name untuk berolahraga bersama!"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              setState(() {
                if (!_invitedFriends.contains(name)) {
                  _invitedFriends.add(name);
                }
              });
              Navigator.of(ctx).pop(); // Close dialog
            },
          ),
        ],
      ),
    );
  }

  void _removeInvite(String name) {
    setState(() {
      _invitedFriends.remove(name);
    });
  }

  bool _isInvited(String name) {
    return _invitedFriends.contains(name);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cari dan Undang Teman',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 214, 138, 5),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'aset_media/gambar/logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Cari Teman',
                    hintText: 'Masukkan nama teman',
                    prefixIcon: const Icon(Icons.person_search),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                  ),
                  onChanged: (value) {
                    _runFilter(value);
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _foundStudents.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundStudents.length,
                          itemBuilder: (context, index) {
                            final String studentName = _foundStudents[index];
                            final bool isInvited = _isInvited(studentName);

                            return Card(
                              key: ValueKey(studentName),
                              color: Colors.white,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey.shade800,
                                  child: CircleAvatar(
                                    radius: 28.5,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Icon(Icons.person, size: 30, color: Colors.grey[600]),
                                  ),
                                ),
                                title: Text(studentName),
                                trailing: isInvited
                                    ? Text(
                                        'Sudah Diundang',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.add_circle_outline, color: theme.primaryColor),
                                        onPressed: () => _sendInvite(studentName),
                                      ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                if (_invitedFriends.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        'Daftar Teman yang Diundang:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _invitedFriends.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(_invitedFriends[index]),
                          color: Colors.white,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade800,
                              child: CircleAvatar(
                                radius: 28.5,
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.person, size: 30, color: Colors.grey[600]),
                              ),
                            ),
                            title: Text(_invitedFriends[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                              onPressed: () => _removeInvite(_invitedFriends[index]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: CariUndangPage(),
  ));
}
