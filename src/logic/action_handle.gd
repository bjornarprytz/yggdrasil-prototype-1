class_name ActionHandle
extends Node

func resolve_action_sequence(animation: Animation, collider: Node, hit_callback: Callable) -> void:
    await animation.windup
    collider.set_enabled(true)
    # Attach hit_callback
    await animation.active_phase
    # Detach hit_callback
    collider.set_enabled(false)
    await animation.winddown
    # hit_callback should call into the action's effects
