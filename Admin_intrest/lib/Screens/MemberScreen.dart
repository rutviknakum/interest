import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  final List<Map<String, String>> members;

  const MemberScreen({super.key, required this.members});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  List<Map<String, String>> membersList = [];

  @override
  void initState() {
    super.initState();
    membersList = List.from(widget.members);
  }

  void _showMemberDetails(Map<String, String> member) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Member Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Text(
                    member['fname']![0],
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Full Name: ${member['fname']} ${member['lname']}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Email: ${member['email']}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                "Phone: ${member['phone']}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _editMember(int index) {
    TextEditingController fnameController = TextEditingController(
      text: membersList[index]['fname'],
    );
    TextEditingController lnameController = TextEditingController(
      text: membersList[index]['lname'],
    );
    TextEditingController emailController = TextEditingController(
      text: membersList[index]['email'],
    );
    TextEditingController phoneController = TextEditingController(
      text: membersList[index]['phone'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Member"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fnameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              TextField(
                controller: lnameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  membersList[index] = {
                    "fname": fnameController.text,
                    "lname": lnameController.text,
                    "email": emailController.text,
                    "phone": phoneController.text,
                  };
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _deleteMember(int index) {
    setState(() {
      membersList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Members List")),
      body:
          membersList.isEmpty
              ? const Center(child: Text("No members added yet."))
              : ListView.builder(
                itemCount: membersList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(membersList[index]['email']!),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      _deleteMember(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Member deleted"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(membersList[index]['fname']![0]),
                        ),
                        title: Text(
                          "${membersList[index]['fname']} ${membersList[index]['lname']}",
                        ),
                        subtitle: Text("Email: ${membersList[index]['email']}"),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == "edit") {
                              _editMember(index);
                            } else if (value == "delete") {
                              _deleteMember(index);
                            }
                          },
                          itemBuilder:
                              (context) => [
                                const PopupMenuItem(
                                  value: "edit",
                                  child: Text("Edit"),
                                ),
                                const PopupMenuItem(
                                  value: "delete",
                                  child: Text("Delete"),
                                ),
                              ],
                        ),
                        onTap: () {
                          _showMemberDetails(membersList[index]);
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
