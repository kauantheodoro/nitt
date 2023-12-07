import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _nomeUsuario = 'Nitt';
  String _emailUsuario = 'nitt@gmail.com';
  String _caminhoImagemPerfil = 'assets/profile_image.jpg'; // Caminho padrão da imagem do perfil
  bool _isEditing = false;
  List<String> _tempImages = [];

  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isEditing
                ? _buildPhotoEditor()
                : CircleAvatar(
              radius: 80,
              backgroundImage: CachedNetworkImageProvider(
                  _caminhoImagemPerfil),
            ),
            SizedBox(height: 20),
            _isEditing
                ? _buildNameEditor()
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _nomeUsuario,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(_emailUsuario),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _isEditing ? _saveEditedData() : _showEditProfileDialog(context);
              },
              child: Text(_isEditing ? 'Salvar' : 'Editar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoEditor() {
    return Expanded(
      child: PhotoViewGallery.builder(
        itemCount: _tempImages.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(File(_tempImages[index])),
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildNameEditor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _nomeController,
        decoration: InputDecoration(labelText: 'Nome'),
      ),
    );
  }

  _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Perfil'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  String? filePath = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  ).then((value) => value?.files.single.path);

                  if (filePath != null) {
                    setState(() {
                      _tempImages = [filePath];
                      _isEditing = true;
                    });
                  }

                  Navigator.pop(context);
                },
                child: Text('Escolher da Pasta'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  _saveEditedData() {
    // Implemente a lógica para salvar as alterações permanentemente.
    setState(() {
      _nomeUsuario = _nomeController.text;
      _isEditing = false;
    });
  }
}
