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
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
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
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
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
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundStudents[index]),
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
                          title: Text(_foundStudents[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.add_circle_outline, color: theme.primaryColor),
                            onPressed: () => _sendInvite(_foundStudents[index]),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
