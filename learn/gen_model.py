from AlphaGo.models.policy import CNNPolicy

arch = {'filters_per_layer': 128, 'layers': 12}  # args to CNNPolicy.create_network()
features = ['board', 'ones', 'turns_since']  # Important! This must match args to game_converter
policy = CNNPolicy(features, **arch)
policy.save_model('data/model/my_model.json')
