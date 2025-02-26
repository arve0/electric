import { EventEmitter } from 'events'
import { ConnectionOptions, Data, Socket } from './index'
import { SatelliteError } from '../util'

export class MockSocket extends EventEmitter implements Socket {
  constructor() {
    super()
  }

  open(_opts: ConnectionOptions): this {
    return this
  }
  write(_data: string | Uint8Array | Buffer): this {
    return this
  }
  closeAndRemoveListeners(): this {
    return this
  }

  onMessage(_cb: (data: Data) => void): void {}
  onError(_cb: (error: SatelliteError) => void): void {}
  onClose(_cb: () => void): void {}
  onceConnect(_cb: () => void): void {}
  onceError(_cb: (error: SatelliteError) => void): void {}
  removeErrorListener(_cb: (error: SatelliteError) => void): void {}
}
